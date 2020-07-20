prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.10.04'
,p_release=>'19.2.0.00.18'
,p_default_workspace_id=>1620873114056663
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'FOS_MASTER_WS'
);
end;
/

prompt APPLICATION 102 - FOS Dev - Plugin Master
--
-- Application Export:
--   Application:     102
--   Name:            FOS Dev - Plugin Master
--   Exported By:     FOS_MASTER_WS
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 49755158803875939
--     PLUGIN: 13235263798301758
--     PLUGIN: 34615171094372499
--     PLUGIN: 37441962356114799
--     PLUGIN: 1846579882179407086
--     PLUGIN: 8354320589762683
--     PLUGIN: 50031193176975232
--     PLUGIN: 34175298479606152
--     PLUGIN: 35822631205839510
--     PLUGIN: 14934236679644451
--     PLUGIN: 2600618193722136
--     PLUGIN: 2657630155025963
--     PLUGIN: 284978227819945411
--   Manifest End
--   Version:         19.2.0.00.18
--   Instance ID:     250144500186934
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/item_type/com_fos_plugin_test
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(34615171094372499)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'COM.FOS.PLUGIN_TEST'
,p_display_name=>'just a plug-in test'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS:APEX_APPL_PAGE_IG_COLUMNS'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'procedure render',
'  ( p_item   in            apex_plugin.t_item',
'  , p_plugin in            apex_plugin.t_plugin',
'  , p_param  in            apex_plugin.t_item_render_param',
'  , p_result in out nocopy apex_plugin.t_item_render_result ',
'  )',
'as',
'    --attributes',
'    l_attribute1 p_item.attribute_01%type := p_item.attribute_01;',
'    l_attribute2 p_item.attribute_02%type := p_item.attribute_02;',
'    l_attribute3 p_item.attribute_03%type := p_item.attribute_03;',
'    ',
'begin',
'',
'    --debug',
'    if apex_application.g_debug ',
'    then',
'        apex_plugin_util.debug_item_render',
'          ( p_plugin => p_plugin',
'          , p_item   => p_item',
'          , p_param  => p_param',
'          );',
'    end if;    ',
'    ',
'end render;'))
,p_api_version=>2
,p_render_function=>'render'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h1>This is just a test, please don''t <strong>approve</strong></h1>',
'<p>',
'This is a wonderful plugin doing absolutely nothing! You would be surprised to learn how little effort it takes to do nothing at all.',
'</p>',
'<p>',
'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea tak'
||'imata sanctus est Lorem ipsum dolor sit amet. <br />',
'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea tak'
||'imata sanctus est Lorem ipsum dolor sit amet.',
'</p>',
'<h2>This is finish, but not the end</h2>',
'<ul>',
'<li>one</li>',
'<li><two/li>',
'<li>three</li>',
'</ul>',
'<p>',
'   you can learn more about plugins at <a href="https://www.foex.at" target="_blank">foex.at</a>',
'</p>'))
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done


