create or replace package com_fos_plugin_test
as

    procedure render
      ( p_item apex_plugin.t_item
      , p_plugin               apex_plugin.t_item
      , p_plugin               apex_plugin.t_plugin
      , p_param                apex_plugin.t_item_render_param
      , p_result in out nocopy apex_plugin.t_item_render_result
      );

end;
/


