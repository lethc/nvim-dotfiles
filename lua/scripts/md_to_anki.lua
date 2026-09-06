-- ~/.config/nvim/lua/md_to_anki.lua
-- ── Integracion md-to-anki <-> Neovim ──────────────────────────
-- Ejecuta el script md-to-anki sobre el archivo Markdown que
-- tienes abierto, preguntando interactivamente por instrucciones
-- adicionales, numero de flashcards, tags y si sincronizar con
-- AnkiWeb.

local M = {}

-- ── CONFIGURA ESTO ──────────────────────────────────────────────
-- Ruta absoluta a la carpeta del proyecto md-to-anki
-- (la carpeta que contiene main.py, cli.py, pyproject.toml, etc.)
M.project_dir = vim.fn.expand("~/Projects/PyDev/md_to_anki")

-- Comando(s) base para ejecutar el script. Se le agregan despues
-- el archivo .md y las flags (-n, -i, -t, --sync).
-- Con uv: uv run ./main.py nota.md ...
M.run_cmd = { "uv", "run", "./main.py" }
-- ─────────────────────────────────────────────────────────────

local function shellescape(s)
  return vim.fn.shellescape(s)
end

--- Ejecuta 'apy tag' y parsea los nombres de tags existentes.
--- Es una llamada sincrona (bloquea Neovim brevemente); apy tag
--- suele responder rapido, pero si algun dia se siente lento se
--- puede migrar a vim.system con callback.
local function obtener_tags_existentes()
  if vim.fn.executable("apy") == 0 then
    return {}
  end

  local salida = vim.fn.systemlist("apy tag")
  if vim.v.shell_error ~= 0 then
    return {}
  end

  local tags = {}
  for _, linea in ipairs(salida) do
    -- Quitar caracteres de bordes de tabla que usan algunas
    -- versiones de apy (rich / box-drawing / pipes)
    local limpia = linea:gsub("[│┃|┆┊┇┋]", " ")
    -- Una fila de datos es "nombre_tag   numero_de_notas" al
    -- final de la linea; esto descarta automaticamente la
    -- cabecera ("tag  notes") y las lineas de borde
    local tag, notas = limpia:match("^%s*(%S+)%s+(%d+)%s*$")
    if tag and notas and tag:lower() ~= "tag" then
      table.insert(tags, tag)
    end
  end

  return tags
end

--- Muestra el selector de tags: existentes + opciones para
--- escribir uno nuevo o no usar ninguno. Llama a callback(tags_str).
local function seleccionar_tags(callback)
  local existentes = obtener_tags_existentes()

  local OPT_NUEVO   = "+ Escribir tag(s) nuevo(s)"
  local OPT_NINGUNO = "(ninguno)"

  local opciones = {}
  for _, t in ipairs(existentes) do
    table.insert(opciones, t)
  end
  table.insert(opciones, OPT_NUEVO)
  table.insert(opciones, OPT_NINGUNO)

  vim.ui.select(opciones, { prompt = "Tag para estas flashcards:" }, function(choice)
    if choice == nil then
      callback(nil) -- cancelado
    elseif choice == OPT_NINGUNO then
      callback("")
    elseif choice == OPT_NUEVO then
      vim.ui.input(
        { prompt = "Nuevo(s) tag(s), separados por espacio: " },
        function(nuevos)
          callback(nuevos or "")
        end
      )
    else
      callback(choice)
    end
  end)
end

--- Ejecuta md-to-anki sobre el archivo actual, preguntando
--- interactivamente los parametros opcionales.
function M.run()
  if vim.bo.filetype ~= "markdown" then
    vim.notify(
      "md-to-anki: el buffer actual no es un archivo Markdown",
      vim.log.levels.WARN
    )
    return
  end

  -- Guardar el archivo antes de procesarlo, para no enviar
  -- una version desactualizada
  if vim.bo.modified then
    vim.cmd("write")
  end

  local file = vim.fn.expand("%:p")

  vim.ui.input(
    { prompt = "Instrucciones adicionales (Enter = ninguna): " },
    function(instrucciones)
      if instrucciones == nil then
        return -- <Esc>, el usuario cancelo
      end

      vim.ui.input(
        { prompt = "Numero de flashcards (Enter = default): " },
        function(n)
          if n == nil then
            return
          end

          seleccionar_tags(function(tags)
            if tags == nil then
              return -- cancelado en el selector de tags
            end

            vim.ui.select(
              { "No", "Si" },
              { prompt = "Sincronizar con AnkiWeb al terminar (--sync)?" },
              function(choice)
                if choice == nil then
                  return
                end
                local sync = (choice == "Si")
                M._ejecutar(file, n, instrucciones, tags, sync)
              end
            )
          end)
        end
      )
    end
  )
end

--- Construye el comando y lo lanza en una terminal integrada
function M._ejecutar(file, n, instrucciones, tags, sync)
  local cmd = {}
  for _, parte in ipairs(M.run_cmd) do
    table.insert(cmd, parte)
  end
  table.insert(cmd, shellescape(file))

  if n ~= "" then
    table.insert(cmd, "-n")
    table.insert(cmd, shellescape(n))
  end

  if instrucciones ~= "" then
    table.insert(cmd, "-i")
    table.insert(cmd, shellescape(instrucciones))
  end

  if tags ~= "" then
    table.insert(cmd, "-t")
    table.insert(cmd, shellescape(tags))
  end

  if sync then
    table.insert(cmd, "--sync")
  end

  local cmd_str = table.concat(cmd, " ")

  -- Abrir una ventana nueva (con un buffer nuevo y vacio, NO el
  -- mismo buffer del markdown) para correr la terminal ahi.
  vim.cmd("botright 15new")
  vim.cmd({ cmd = "lcd", args = { M.project_dir } })
  vim.fn.termopen(cmd_str, {
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("md-to-anki: proceso finalizado correctamente", vim.log.levels.INFO)
      else
        vim.notify("md-to-anki: el proceso termino con errores (codigo " .. code .. ")", vim.log.levels.ERROR)
      end
    end,
  })
  vim.cmd("startinsert")
end

--- Version rapida: usa siempre los valores por defecto del script
--- (sin preguntar nada), util si casi siempre usas la misma config.
function M.run_rapido()
  if vim.bo.filetype ~= "markdown" then
    vim.notify("md-to-anki: el buffer actual no es un archivo Markdown", vim.log.levels.WARN)
    return
  end
  if vim.bo.modified then
    vim.cmd("write")
  end
  M._ejecutar(vim.fn.expand("%:p"), "", "", "", false)
end

return M
