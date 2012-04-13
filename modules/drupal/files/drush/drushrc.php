<?php

/**
 * List of tables whose *data* is skipped by the 'sql-dump' and 'sql-sync'
 * commands when the "--structure-tables-key=common" option is provided.
 * You may add specific tables to the existing array or add a new element.
 */
$options['structure-tables']['common'] = array(
  'cache',
  'cache_filter',
  'cache_menu',
  'cache_page',
  'history',
  'sessions',
  'watchdog'
);

$options['structure-tables-key'] = 'common';

// Set a predetermined username and password when using site-install.
$command_specific['site-install'] = array('account-name' => 'admin', 'account-pass' => 'admin');

