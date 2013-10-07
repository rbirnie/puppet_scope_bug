puppet_scope_bug
================

A bug with dynamic variable lookup and templates. For some reason templates have a different set of variables than their parent manifest. It seems like in templates dynamic variable lookup is allowed but not in the manifest.

You can see this in the Notify[undef] message given off from configuration.pp

```
Info: Applying configuration version '1381181340'
Notice: /Stage[main]/Scopebug::Classes::Configuration/File[/tmp/tmp.conf]/content: 
--- /tmp/tmp.conf	2013-10-07 21:24:40.967195525 +0000
+++ /tmp/puppet-file20131007-30910-5xh171-0	2013-10-07 21:29:14.930946673 +0000
@@ -0,0 +1,5 @@
+test file!
+
+var = true
+
+

Notice: /Stage[main]/Scopebug::Classes::Configuration/File[/tmp/tmp.conf]/content: current_value {md5}d41d8cd98f00b204e9800998ecf8427e, should be {md5}38f2683b655fa66c8954dc84c7d8c4fa (noop)
Notice: /Stage[main]/Scopebug::Classes::Configuration/Notify[undef]/message: current_value absent, should be undef (noop)
Notice: Class[Scopebug::Classes::Configuration]: Would have triggered 'refresh' from 2 events
Notice: Stage[main]: Would have triggered 'refresh' from 1 events
Notice: Finished catalog run in 14.58 seconds
```
