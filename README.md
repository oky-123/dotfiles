##環境構築

```
sh ./setup.sh
```

## jdt-ls設定

```
'java',
'-javaagent:' . s:lombok_path,
'-Xbootclasspath/a:' . s:lombok_path,
'-Declipse.application=org.eclipse.jdt.ls.core.id1',
'-Dosgi.bundles.defaultStartLevel=4',
'-Declipse.product=org.eclipse.jdt.ls.core.product',
'-Dlog.level=ALL',
'-noverify',
'-Dfile.encoding=UTF-8',
'-Xmx1G',
'-jar',
expand('~/.lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.4.0.v20161219-1356.jar'),
'-configuration',
expand('~/.lsp/eclipse.jdt.ls/config_mac'),
'-data',
getcwd()
```

```
java
-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044
-Declipse.application=org.eclipse.jdt.ls.core.id1
-Dosgi.bundles.defaultStartLevel=4
-Declipse.product=org.eclipse.jdt.ls.core.product
-Dlog.level=ALL
-noverify
-Xmx1G
-jar ./plugins/org.eclipse.equinox.launcher_1.5.200.v20180922-1751.jar
-configuration ./config_linux
-data /path/to/data
--add-modules=ALL-SYSTEM
--add-opens java.base/java.util=ALL-UNNAMED
--add-opens java.base/java.lang=ALL-UNNAMED
```

```vimscript
let s:lombok_path = $HOME . '/.lsp/lombok.jar'
let s:eclipse_jdt_ls_jar_path = $HOME . '/.lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.4.0.v20161219-1356.jar'
let s:eclipse_jdt_ls_config_path = $HOME . '/.lsp/eclipse.jdt.ls/config_mac'
let s:java_11_path = '/usr/local/Cellar/openjdk@11/11.0.9/libexec/openjdk.jdk/Contents/Home/bin/java'

if executable(s:java_11_path) && filereadable(s:eclipse_jdt_ls_jar_path) && filereadable(s:lombok_path)
    au User lsp_setup call lsp#register_server({
        \ 'name': 'eclipse.jdt.ls',
        \ 'cmd': {server_info->[
        \     s:java_11_path,
        \     '-javaagent:' . s:lombok_path,
        \     '-Xbootclasspath/a:' . s:lombok_path,
        \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        \     '-Dosgi.bundles.defaultStartLevel=4',
        \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
        \     '-Dlog.protocol=true',
        \     '-Dlog.level=ALL',
        \     '-Xms1g',
        \     '-Xmx2G',
        \     '-jar',
        \     s:eclipse_jdt_ls_jar_path,
        \     '-configuration',
        \     s:eclipse_jdt_ls_config_path,
        \     '-data',
        \     getcwd(),
        \     '--add-modules=ALL-SYSTEM',
        \     '--add-opens',
        \     'java.base/java.util=ALL-UNNAMED',
        \     '--add-opens',
        \     'java.base/java.lang=ALL-UNNAMED'
        \ ]},
        \ 'whitelist': ['java'],
        \ })
endif
```

```vimscript
if executable('java') && filereadable(expand('~/.lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.4.0.v20161219-1356.jar')) && filereadable(expand(s:lombok_path))
    au User lsp_setup call lsp#register_server({
        \ 'name': 'eclipse.jdt.ls',
        \ 'cmd': {server_info->[
        \     s:java_11_path,
        \     '-javaagent:' . s:lombok_path,
        \     '-Xbootclasspath/a:' . s:lombok_path,
        \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        \     '-Dosgi.bundles.defaultStartLevel=4',
        \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
        \     '-Dlog.level=ALL',
        \     '-noverify',
        \     '-Dfile.encoding=UTF-8',
        \     '-Xmx1G',
        \     '-jar',
        \     expand('~/.lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.4.0.v20161219-1356.jar'),
        \     '-configuration',
        \     expand('~/.lsp/eclipse.jdt.ls/config_mac'),
        \     '-data',
        \     getcwd()
        \ ]},
        \ 'whitelist': ['java'],
        \ })
endif
```
