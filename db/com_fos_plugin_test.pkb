create or replace package body com_fos_plugin_test
as

procedure render
  ( p_item   in            apex_plugin.t_item
  , p_plugin in            apex_plugin.t_plugin
  , p_param  in            apex_plugin.t_item_render_param
  , p_result in out nocopy apex_plugin.t_item_render_result
  )
as
    --attributes
    l_attribute1 p_item.attribute_01%type := p_item.attribute_01;
    l_attribute2 p_item.attribute_02%type := p_item.attribute_02;
    l_attribute3 p_item.attribute_03%type := p_item.attribute_03;

begin

    --debug
    if apex_application.g_debug
    then
        apex_plugin_util.debug_item_render
          ( p_plugin => p_plugin
          , p_item   => p_item
          , p_param  => p_param
          );
    end if;

end render;

end;
/


