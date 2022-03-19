1 NAME
======

  trivial-configuration --- A trivial configuration file reader.


2 VERSION
=========

  ,----
  | 0.2
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
  | a=b
  | foo=hello
  | baz="some whitespace contained"
  | quux="some whitespace with \"escape\""
  | num=56
  | make_me_param_case=12.5
  | db_user=foo
  | db_pass=bar
  | db_host=localhost
  | db_port=5432
  | db_name=names
  | database_url="postgres://$db_user:$db_pass@$db_host:$db_port/$db_name"
  `----

  Read them in:

  ,----
  | CL-USER> (config:read-config "app.conf")
  | ; No value
  `----

  Use them:

  ,----
  | CL-USER> *a*
  | "b"
  | CL-USER> *foo*
  | "hello"
  | CL-USER> *baz*
  | "some whitespace contained"
  | CL-USER> *quux*
  | "some whitespace with \"escape\""
  | CL-USER> *num*
  | 56
  | CL-USER> *make-me-param-case*
  | 12.5
  | CL-USER> *db-user*
  | "foo"
  | CL-USER> *db-pass*
  | "bar"
  | CL-USER> *db-host*
  | "localhost"
  | CL-USER> *db-port*
  | 5432
  | CL-USER> *db-name*
  | "names"
  | CL-USER> *database-url*
  | "postgres://foo:bar@localhost:5432/names"
  `----


5 AUTHOR
========

  Sebastian Christ (<mailto:rudolfo.christ@pm.me>)


6 LICENSE
=========

  Released under the MLP-2.0 license.
