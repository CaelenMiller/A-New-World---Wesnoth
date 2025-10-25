-- ~add-ons/A_New_World/lua/diplomacy.lua
-- Dummy Diplomacy dialog: GUI2-compliant, no external state.

local M = {}
local GUI = rawget(_G, "gui") or wesnoth

function M.init() end  -- no-op for now

local function build_dummy_config()
    -- Build a REAL WML config using wml.load (per GUI2 docs).
    return wml.load[[
        [window]
            id=anw_diplomacy_dummy
            [resolution]
                definition=default
                automatic_placement=yes
                maximum_height=600
                maximum_width=700

                # Required by GUI2: both blocks must exist and have an id.
                [tooltip]
                    id=tooltip_large
                [/tooltip]
                [helptip]
                    id=tooltip_large
                [/helptip]

                [grid]
                    [row]
                        [column]
                            grow_factor=1
                            [label]
                                id=title
                                label="Diplomacy (prototype)"
                            [/label]
                        [/column]
                    [/row]
                    [row]
                        [column]
                            grow_factor=1
                            [label]
                                id=body
                                wrap=yes
                                label="This is a dummy dialog to verify it opens. No data is read or written."
                            [/label]
                        [/column]
                    [/row]
                    [row]
                        [column]
                            horizontal_alignment=right
                            [button]
                                id=ok
                                label="Close"
                                return_value=1
                            [/button]
                        [/column]
                    [/row]
                [/grid]
            [/resolution]
        [/window]
    ]]
end

function M.open_menu()
    local def = build_dummy_config()
    local function preshow()
        GUI.set_dialog_value("Diplomacy (dummy)", "title")
    end
    GUI.show_dialog(def, preshow)  -- passes a proper WML config
end

diplomacy = M
return M
