local function focus_or_launch(identifier, launch_cmd)
  return function()
    local windows = hl.get_windows()
    local target = nil

    for _, w in pairs(windows) do
      if (w.initial_title == identifier) or (w.initial_class == identifier) then
        target = w
        break
      end
    end

    if target ~= nil then
      hl.dispatch(hl.dsp.focus({ workspace = tostring(target.workspace.id) }))
      hl.dispatch(hl.dsp.focus({ window = target }))
    else
      hl.dispatch(hl.dsp.exec_cmd(launch_cmd))
    end
  end
end

return focus_or_launch
