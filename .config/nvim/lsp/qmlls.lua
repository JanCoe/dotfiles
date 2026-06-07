---@brief
---
--- https://github.com/nicdraffin/qmlls.nvim
---
--- QML language server, shipped with Qt 6.
---
--- Install via `qt6-qtdeclarative-devel` on Fedora:
--- ```sh
--- sudo dnf install qt6-qtdeclarative-devel
--- ```
return {
  cmd = { 'qmlls' },
  filetypes = { 'qml' },
  root_markers = { '.git' },
}
