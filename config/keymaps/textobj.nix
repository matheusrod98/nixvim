{
  programs.nixvim.keymaps = let
    selectTextobject = key: query: desc: {
      mode = [
        "x"
        "o"
      ];
      inherit key;
      action.__raw = ''function() require("nvim-treesitter-textobjects.select").select_textobject("${query}", "textobjects") end'';
      options = {
        inherit desc;
        silent = true;
      };
    };

    moveTextobject = key: method: query: desc: {
      mode = [
        "n"
        "x"
        "o"
      ];
      inherit key;
      action.__raw = ''function() require("nvim-treesitter-textobjects.move").${method}("${query}", "textobjects") end'';
      options = {
        inherit desc;
        silent = true;
      };
    };

    repeatMove = key: method: desc: {
      mode = [
        "n"
        "x"
        "o"
      ];
      inherit key;
      action.__raw = ''function() require("nvim-treesitter-textobjects.repeatable_move").${method}() end'';
      options = {
        inherit desc;
        silent = true;
      };
    };
  in [
    (selectTextobject "af" "@function.outer" "Around function")
    (selectTextobject "if" "@function.inner" "Inside function")
    (selectTextobject "ac" "@class.outer" "Around class")
    (selectTextobject "ic" "@class.inner" "Inside class")
    (selectTextobject "aa" "@parameter.outer" "Around argument")
    (selectTextobject "ia" "@parameter.inner" "Inside argument")
    (selectTextobject "ab" "@block.outer" "Around block")
    (selectTextobject "ib" "@block.inner" "Inside block")
    (selectTextobject "al" "@loop.outer" "Around loop")
    (selectTextobject "il" "@loop.inner" "Inside loop")
    (selectTextobject "ai" "@conditional.outer" "Around conditional")
    (selectTextobject "ii" "@conditional.inner" "Inside conditional")
    (selectTextobject "am" "@call.outer" "Around call")
    (selectTextobject "im" "@call.inner" "Inside call")
    (moveTextobject "]m" "goto_next_start" "@function.outer" "Next function start")
    (moveTextobject "[m" "goto_previous_start" "@function.outer" "Previous function start")
    (moveTextobject "]M" "goto_next_end" "@function.outer" "Next function end")
    (moveTextobject "[M" "goto_previous_end" "@function.outer" "Previous function end")
    (moveTextobject "]]" "goto_next_start" "@class.outer" "Next class start")
    (moveTextobject "[[" "goto_previous_start" "@class.outer" "Previous class start")
    (moveTextobject "][" "goto_next_end" "@class.outer" "Next class end")
    (moveTextobject "[]" "goto_previous_end" "@class.outer" "Previous class end")
    (moveTextobject "]o" "goto_next_start" "@loop.outer" "Next loop start")
    (moveTextobject "[o" "goto_previous_start" "@loop.outer" "Previous loop start")
    (moveTextobject "]d" "goto_next" "@conditional.outer" "Next conditional")
    (moveTextobject "[d" "goto_previous" "@conditional.outer" "Previous conditional")
    (repeatMove ";" "repeat_last_move" "Repeat last Treesitter move")
    (repeatMove "," "repeat_last_move_opposite" "Repeat last Treesitter move opposite")
  ];
}
