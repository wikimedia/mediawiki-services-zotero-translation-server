Introduction
============

WMF deployable repository of zotero translation server

This is a preliminary approach but is indeed used in production.
This repo is a product of:

1. Cloning the repo:

   $ git clone https://github.com/zotero/translation-server.git

2. Getting the zotero extension itself as a git submodule

   $ git submodule init
   $ git submodule update

3. Running wmf-build.sh.

What gives?
===========

 wmf-build.sh is a modified version of build.sh
by the zotero project and is meant to create a clean repo without DLLs,
.so files, xpcshell, omni.ja or other non-necessary stuff inside it. The
result is a pure javascript + a chrome.manifest file repo which is way
cleaner that the one created by the original build.sh. Of course it
requires xulrunner and xpcshell to run. Those dependencies are fulfilled
in the zotero puppet module

Configuration
=============
Take a look a the zotero puppet module. All in all what is needed is a
directory containing the zotero translators and a defaults.js prefs file
in defaults/preferences
