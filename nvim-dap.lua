return {
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dap.adapters.gdb = {
      type = "executable",
      command = "arm-none-eabi-gdb",
      args = { "-q", "--interpreter=dap" },
    }

    dap.configurations.c = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = "${workspaceFolder}/build/mein_projekt.elf",
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
        setupCommands = {
          { text = "target remote localhost:3333" },
          { text = "load" },
        },
      },
    }

    -- DAP UI Setup
    dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
