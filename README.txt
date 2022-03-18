1 NAME
======

  trivial-configuration --- A trivial configuration file reader.


2 VERSION
=========

  ,----
  | 0.1
  `----


3 SYNOPSIS
==========

  ,----
  | (config:read-config "/path/to/config.conf")
  | *server-port* ;=> 5000
  `----


4 DESCRIPTION
=============

  Translate simple configuration `key=value' pairs to global variables.

  Example:

  app.conf
  ,----
  | server_port=5000
  | database_host=localhost
  | database_port=45098
  `----

  Read them in:

  ,----
  | (config:read-confgi "app.conf")
  `----

  Use them:

  ,----
  | (start-server :port *server_port*)
  | (conncet-db *database-host* *database-port*)
  `----


5 AUTHOR
========

  Sebastian Christ (<mailto:rudolfo.christ@pm.me>)


6 LICENSE
=========

  Released under the MLP-2.0 license.
