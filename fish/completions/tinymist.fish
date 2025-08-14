# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_tinymist_global_optspecs
    string join \n h/help V/version
end

function __fish_tinymist_needs_command
    # Figure out if the current invocation already has a command.
    set -l cmd (commandline -opc)
    set -e cmd[1]
    argparse -s (__fish_tinymist_global_optspecs) -- $cmd 2>/dev/null
    or return
    if set -q argv[1]
        # Also print the command, so this can be used to figure out what it is.
        echo $argv[1]
        return 1
    end
    return 0
end

function __fish_tinymist_using_subcommand
    set -l cmd (__fish_tinymist_needs_command)
    test -z "$cmd"
    and return 1
    contains -- $cmd[1] $argv
end

complete -c tinymist -n __fish_tinymist_needs_command -s h -l help -d 'Print help'
complete -c tinymist -n __fish_tinymist_needs_command -s V -l version -d 'Print version'
complete -c tinymist -n __fish_tinymist_needs_command -f -a probe -d 'Probes existence (Nop run)'
complete -c tinymist -n __fish_tinymist_needs_command -f -a completion -d 'Generates completion script to stdout'
complete -c tinymist -n __fish_tinymist_needs_command -f -a lsp -d 'Runs language server'
complete -c tinymist -n __fish_tinymist_needs_command -f -a dap -d 'Runs debug adapter'
complete -c tinymist -n __fish_tinymist_needs_command -f -a trace-lsp -d 'Runs language server for tracing some typst program'
complete -c tinymist -n __fish_tinymist_needs_command -f -a preview -d 'Runs preview server'
complete -c tinymist -n __fish_tinymist_needs_command -f -a cov -d 'Execute a document and collect coverage'
complete -c tinymist -n __fish_tinymist_needs_command -f -a test -d 'Test a document and gives summary'
complete -c tinymist -n __fish_tinymist_needs_command -f -a compile -d 'Runs compile command like `typst-cli compile`'
complete -c tinymist -n __fish_tinymist_needs_command -f -a generate-script -d 'Generates build script for compilation'
complete -c tinymist -n __fish_tinymist_needs_command -f -a query -d 'Runs language query'
complete -c tinymist -n __fish_tinymist_needs_command -f -a doc -d 'Runs documents'
complete -c tinymist -n __fish_tinymist_needs_command -f -a task -d 'Runs tasks'
complete -c tinymist -n __fish_tinymist_needs_command -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c tinymist -n "__fish_tinymist_using_subcommand probe" -s h -l help -d 'Print help'
complete -c tinymist -n "__fish_tinymist_using_subcommand completion" -s h -l help -d 'Print help'
complete -c tinymist -n "__fish_tinymist_using_subcommand lsp" -l mirror -d 'Mirror the stdin to the file' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand lsp" -l replay -d 'Replay input from the file' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand lsp" -l font-path -d 'Font paths' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand lsp" -l ignore-system-fonts -d 'Ensures system fonts won\'t be searched, unless explicitly included via `--font-path`'
complete -c tinymist -n "__fish_tinymist_using_subcommand lsp" -s h -l help -d 'Print help'
complete -c tinymist -n "__fish_tinymist_using_subcommand dap" -l mirror -d 'Mirror the stdin to the file' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand dap" -l replay -d 'Replay input from the file' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand dap" -l font-path -d 'Font paths' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand dap" -l ignore-system-fonts -d 'Ensures system fonts won\'t be searched, unless explicitly included via `--font-path`'
complete -c tinymist -n "__fish_tinymist_using_subcommand dap" -s h -l help -d 'Print help'
complete -c tinymist -n "__fish_tinymist_using_subcommand trace-lsp" -l rpc-kind -r
complete -c tinymist -n "__fish_tinymist_using_subcommand trace-lsp" -l mirror -d 'Mirror the stdin to the file' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand trace-lsp" -l replay -d 'Replay input from the file' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand trace-lsp" -l root -d 'Configures the project root (for absolute paths)' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand trace-lsp" -l font-path -d 'Font paths' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand trace-lsp" -l package-path -d 'Custom path to local packages, defaults to system-dependent location' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand trace-lsp" -l package-cache-path -d 'Custom path to package cache, defaults to system-dependent location' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand trace-lsp" -l features -d 'Enables in-development features that may be changed or removed at any time' -r -f -a "html\t''"
complete -c tinymist -n "__fish_tinymist_using_subcommand trace-lsp" -l input -d 'Add a string key-value pair visible through `sys.inputs`' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand trace-lsp" -l creation-timestamp -d 'The document\'s creation date formatted as a UNIX timestamp (in seconds)' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand trace-lsp" -l pdf-standard -d 'One (or multiple comma-separated) PDF standards that Typst will enforce conformance with' -r -f -a "1.7\t'PDF 1.7'
a-2b\t'PDF/A-2b'
a-3b\t'PDF/A-3b'"
complete -c tinymist -n "__fish_tinymist_using_subcommand trace-lsp" -l cert -d 'Path to CA certificate file for network access, especially for downloading typst packages' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand trace-lsp" -l persist
complete -c tinymist -n "__fish_tinymist_using_subcommand trace-lsp" -l ignore-system-fonts -d 'Ensures system fonts won\'t be searched, unless explicitly included via `--font-path`'
complete -c tinymist -n "__fish_tinymist_using_subcommand trace-lsp" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l invert-colors -d 'Invert colors of the preview (useful for dark themes without cost). Please note you could see the origin colors when you hover elements in the preview' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l task-id -d 'Used by lsp for identifying the task' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l refresh-style -d 'Used by lsp for controlling the preview refresh style' -r -f -a "onSave\t'Refresh preview on save'
onType\t'Refresh preview on type'"
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l root -d 'Configures the project root (for absolute paths)' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l font-path -d 'Font paths' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l package-path -d 'Custom path to local packages, defaults to system-dependent location' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l package-cache-path -d 'Custom path to package cache, defaults to system-dependent location' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l features -d 'Enables in-development features that may be changed or removed at any time' -r -f -a "html\t''"
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l input -d 'Add a string key-value pair visible through `sys.inputs`' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l creation-timestamp -d 'The document\'s creation date formatted as a UNIX timestamp (in seconds)' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l pdf-standard -d 'One (or multiple comma-separated) PDF standards that Typst will enforce conformance with' -r -f -a "1.7\t'PDF 1.7'
a-2b\t'PDF/A-2b'
a-3b\t'PDF/A-3b'"
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l cert -d 'Path to CA certificate file for network access, especially for downloading typst packages' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l preview-mode -d 'Preview mode' -r -f -a "document\t'Preview mode for regular document'
slide\t'Preview mode for slide'"
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l data-plane-host -d 'Data plane server will bind to this address. Note: if it equals to `static_file_host`, same address will be used' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l control-plane-host -d 'Control plane server will bind to this address' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l host -d '(Deprecated) (File) Host for the preview server. Note: if it equals to `data_plane_host`, same address will be used' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l partial-rendering -d 'Only render visible part of the document. This can improve performance but still being experimental'
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l ignore-system-fonts -d 'Ensures system fonts won\'t be searched, unless explicitly included via `--font-path`'
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l not-primary -d 'Let it not be the primary instance'
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l open -d 'Open the preview in the browser after compilation. If `--no-open` is set, this flag will be ignored'
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -l no-open -d 'Don\'t open the preview in the browser after compilation. If `--open` is set as well, this flag will win'
complete -c tinymist -n "__fish_tinymist_using_subcommand preview" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c tinymist -n "__fish_tinymist_using_subcommand cov" -l root -d 'Configures the project root (for absolute paths)' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand cov" -l font-path -d 'Font paths' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand cov" -l package-path -d 'Custom path to local packages, defaults to system-dependent location' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand cov" -l package-cache-path -d 'Custom path to package cache, defaults to system-dependent location' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand cov" -l features -d 'Enables in-development features that may be changed or removed at any time' -r -f -a "html\t''"
complete -c tinymist -n "__fish_tinymist_using_subcommand cov" -l input -d 'Add a string key-value pair visible through `sys.inputs`' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand cov" -l creation-timestamp -d 'The document\'s creation date formatted as a UNIX timestamp (in seconds)' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand cov" -l pdf-standard -d 'One (or multiple comma-separated) PDF standards that Typst will enforce conformance with' -r -f -a "1.7\t'PDF 1.7'
a-2b\t'PDF/A-2b'
a-3b\t'PDF/A-3b'"
complete -c tinymist -n "__fish_tinymist_using_subcommand cov" -l cert -d 'Path to CA certificate file for network access, especially for downloading typst packages' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand cov" -l ignore-system-fonts -d 'Ensures system fonts won\'t be searched, unless explicitly included via `--font-path`'
complete -c tinymist -n "__fish_tinymist_using_subcommand cov" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l root -d 'Configures the project root (for absolute paths)' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l font-path -d 'Font paths' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l package-path -d 'Custom path to local packages, defaults to system-dependent location' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l package-cache-path -d 'Custom path to package cache, defaults to system-dependent location' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l features -d 'Enables in-development features that may be changed or removed at any time' -r -f -a "html\t''"
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l input -d 'Add a string key-value pair visible through `sys.inputs`' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l creation-timestamp -d 'The document\'s creation date formatted as a UNIX timestamp (in seconds)' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l pdf-standard -d 'One (or multiple comma-separated) PDF standards that Typst will enforce conformance with' -r -f -a "1.7\t'PDF 1.7'
a-2b\t'PDF/A-2b'
a-3b\t'PDF/A-3b'"
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l cert -d 'Path to CA certificate file for network access, especially for downloading typst packages' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l ppi -d 'The PPI (pixels per inch) to use for PNG export' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l print-coverage -d 'Style of printing coverage' -r -f -a "never\t'Don\'t print the coverage'
short\t'Prints the coverage in a short format'
full\t'Prints the coverage in a full format'"
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l ignore-system-fonts -d 'Ensures system fonts won\'t be searched, unless explicitly included via `--font-path`'
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l update -d 'Whether to update the reference images'
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l coverage -d 'Whether to collect coverage'
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l watch -d 'Whether to run in watch mode'
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l dashboard -d 'Whether to render the dashboard'
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l no-dashboard -d 'Whether not to render the dashboard'
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -l verbose -d 'Whether to log verbose information'
complete -c tinymist -n "__fish_tinymist_using_subcommand test" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c tinymist -n "__fish_tinymist_using_subcommand compile" -l name -d 'Give a name to the document' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand compile" -l root -d 'Configures the project root (for absolute paths)' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand compile" -l font-path -d 'Font paths' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand compile" -l package-path -d 'Custom path to local packages, defaults to system-dependent location' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand compile" -l package-cache-path -d 'Custom path to package cache, defaults to system-dependent location' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand compile" -l task -d 'Name a task' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand compile" -l when -d 'When to run the task' -r -f -a "never\t'Never watch to run task'
onSave\t'Run task on saving the document, i.e. on `textDocument/didSave` events'
onType\t'Run task on typing, i.e. on `textDocument/didChange` events'
onDocumentHasTitle\t'*DEPRECATED* Run task when a document has a title and on saved, which is useful to filter out template files'"
complete -c tinymist -n "__fish_tinymist_using_subcommand compile" -s f -l format -d 'The format of the output file, inferred from the extension by default' -r -f -a "pdf\t'Export to PDF'
png\t'Export to PNG'
svg\t'Export to SVG'
html\t'Export to HTML'"
complete -c tinymist -n "__fish_tinymist_using_subcommand compile" -l pages -d 'Which pages to export. When unspecified, all pages are exported' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand compile" -l pdf-standard -d 'One (or multiple comma-separated) PDF standards that Typst will enforce conformance with' -r -f -a "1.7\t'PDF 1.7'
a-2b\t'PDF/A-2b'
a-3b\t'PDF/A-3b'"
complete -c tinymist -n "__fish_tinymist_using_subcommand compile" -l ppi -d 'The PPI (pixels per inch) to use for PNG export' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand compile" -l lockfile -d 'Specifies the path to the lock file. If the path is set, the lock file will be saved' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand compile" -l ignore-system-fonts -d 'Ensures system fonts won\'t be searched, unless explicitly included via `--font-path`'
complete -c tinymist -n "__fish_tinymist_using_subcommand compile" -l save-lock -d 'Saves the compilation arguments to the lock file'
complete -c tinymist -n "__fish_tinymist_using_subcommand compile" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c tinymist -n "__fish_tinymist_using_subcommand generate-script" -s o -l output -d 'The path to the output script' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand generate-script" -s h -l help -d 'Print help'
complete -c tinymist -n "__fish_tinymist_using_subcommand query; and not __fish_seen_subcommand_from packageDocs checkPackage help" -s h -l help -d 'Print help'
complete -c tinymist -n "__fish_tinymist_using_subcommand query; and not __fish_seen_subcommand_from packageDocs checkPackage help" -f -a packageDocs -d 'Get the documentation for a specific package'
complete -c tinymist -n "__fish_tinymist_using_subcommand query; and not __fish_seen_subcommand_from packageDocs checkPackage help" -f -a checkPackage -d 'Check a specific package'
complete -c tinymist -n "__fish_tinymist_using_subcommand query; and not __fish_seen_subcommand_from packageDocs checkPackage help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c tinymist -n "__fish_tinymist_using_subcommand query; and __fish_seen_subcommand_from packageDocs" -l path -d 'The path of the package to request docs for' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand query; and __fish_seen_subcommand_from packageDocs" -l id -d 'The package of the package to request docs for' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand query; and __fish_seen_subcommand_from packageDocs" -s o -l output -d 'The output path for the requested docs' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand query; and __fish_seen_subcommand_from packageDocs" -s h -l help -d 'Print help'
complete -c tinymist -n "__fish_tinymist_using_subcommand query; and __fish_seen_subcommand_from checkPackage" -l path -d 'The path of the package to request docs for' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand query; and __fish_seen_subcommand_from checkPackage" -l id -d 'The package of the package to request docs for' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand query; and __fish_seen_subcommand_from checkPackage" -s o -l output -d 'The output path for the requested docs' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand query; and __fish_seen_subcommand_from checkPackage" -s h -l help -d 'Print help'
complete -c tinymist -n "__fish_tinymist_using_subcommand query; and __fish_seen_subcommand_from help" -f -a packageDocs -d 'Get the documentation for a specific package'
complete -c tinymist -n "__fish_tinymist_using_subcommand query; and __fish_seen_subcommand_from help" -f -a checkPackage -d 'Check a specific package'
complete -c tinymist -n "__fish_tinymist_using_subcommand query; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and not __fish_seen_subcommand_from new configure help" -s h -l help -d 'Print help'
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and not __fish_seen_subcommand_from new configure help" -f -a new -d 'Declare a document (project input)'
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and not __fish_seen_subcommand_from new configure help" -f -a configure -d 'Configure document priority in workspace'
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and not __fish_seen_subcommand_from new configure help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and __fish_seen_subcommand_from new" -l name -d 'Give a name to the document' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and __fish_seen_subcommand_from new" -l root -d 'Configures the project root (for absolute paths)' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and __fish_seen_subcommand_from new" -l font-path -d 'Font paths' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and __fish_seen_subcommand_from new" -l package-path -d 'Custom path to local packages, defaults to system-dependent location' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and __fish_seen_subcommand_from new" -l package-cache-path -d 'Custom path to package cache, defaults to system-dependent location' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and __fish_seen_subcommand_from new" -l ignore-system-fonts -d 'Ensures system fonts won\'t be searched, unless explicitly included via `--font-path`'
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and __fish_seen_subcommand_from new" -s h -l help -d 'Print help'
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and __fish_seen_subcommand_from configure" -l name -d 'Give a name to the document' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and __fish_seen_subcommand_from configure" -l priority -d 'Set the unsigned priority of these task (lower numbers are higher priority)' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and __fish_seen_subcommand_from configure" -s h -l help -d 'Print help'
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and __fish_seen_subcommand_from help" -f -a new -d 'Declare a document (project input)'
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and __fish_seen_subcommand_from help" -f -a configure -d 'Configure document priority in workspace'
complete -c tinymist -n "__fish_tinymist_using_subcommand doc; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and not __fish_seen_subcommand_from preview help" -s h -l help -d 'Print help'
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and not __fish_seen_subcommand_from preview help" -f -a preview -d 'Declare a preview task'
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and not __fish_seen_subcommand_from preview help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and __fish_seen_subcommand_from preview" -l name -d 'Give a name to the document' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and __fish_seen_subcommand_from preview" -l root -d 'Configures the project root (for absolute paths)' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and __fish_seen_subcommand_from preview" -l font-path -d 'Font paths' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and __fish_seen_subcommand_from preview" -l package-path -d 'Custom path to local packages, defaults to system-dependent location' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and __fish_seen_subcommand_from preview" -l package-cache-path -d 'Custom path to package cache, defaults to system-dependent location' -r -F
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and __fish_seen_subcommand_from preview" -l task -d 'Name a task' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and __fish_seen_subcommand_from preview" -l when -d 'When to run the task' -r -f -a "never\t'Never watch to run task'
onSave\t'Run task on saving the document, i.e. on `textDocument/didSave` events'
onType\t'Run task on typing, i.e. on `textDocument/didChange` events'
onDocumentHasTitle\t'*DEPRECATED* Run task when a document has a title and on saved, which is useful to filter out template files'"
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and __fish_seen_subcommand_from preview" -l invert-colors -d 'Invert colors of the preview (useful for dark themes without cost). Please note you could see the origin colors when you hover elements in the preview' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and __fish_seen_subcommand_from preview" -l task-id -d 'Used by lsp for identifying the task' -r
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and __fish_seen_subcommand_from preview" -l refresh-style -d 'Used by lsp for controlling the preview refresh style' -r -f -a "onSave\t'Refresh preview on save'
onType\t'Refresh preview on type'"
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and __fish_seen_subcommand_from preview" -l preview-mode -d 'Preview mode' -r -f -a "document\t'Preview mode for regular document'
slide\t'Preview mode for slide'"
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and __fish_seen_subcommand_from preview" -l ignore-system-fonts -d 'Ensures system fonts won\'t be searched, unless explicitly included via `--font-path`'
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and __fish_seen_subcommand_from preview" -l partial-rendering -d 'Only render visible part of the document. This can improve performance but still being experimental'
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and __fish_seen_subcommand_from preview" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and __fish_seen_subcommand_from help" -f -a preview -d 'Declare a preview task'
complete -c tinymist -n "__fish_tinymist_using_subcommand task; and __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and not __fish_seen_subcommand_from probe completion lsp dap trace-lsp preview cov test compile generate-script query doc task help" -f -a probe -d 'Probes existence (Nop run)'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and not __fish_seen_subcommand_from probe completion lsp dap trace-lsp preview cov test compile generate-script query doc task help" -f -a completion -d 'Generates completion script to stdout'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and not __fish_seen_subcommand_from probe completion lsp dap trace-lsp preview cov test compile generate-script query doc task help" -f -a lsp -d 'Runs language server'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and not __fish_seen_subcommand_from probe completion lsp dap trace-lsp preview cov test compile generate-script query doc task help" -f -a dap -d 'Runs debug adapter'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and not __fish_seen_subcommand_from probe completion lsp dap trace-lsp preview cov test compile generate-script query doc task help" -f -a trace-lsp -d 'Runs language server for tracing some typst program'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and not __fish_seen_subcommand_from probe completion lsp dap trace-lsp preview cov test compile generate-script query doc task help" -f -a preview -d 'Runs preview server'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and not __fish_seen_subcommand_from probe completion lsp dap trace-lsp preview cov test compile generate-script query doc task help" -f -a cov -d 'Execute a document and collect coverage'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and not __fish_seen_subcommand_from probe completion lsp dap trace-lsp preview cov test compile generate-script query doc task help" -f -a test -d 'Test a document and gives summary'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and not __fish_seen_subcommand_from probe completion lsp dap trace-lsp preview cov test compile generate-script query doc task help" -f -a compile -d 'Runs compile command like `typst-cli compile`'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and not __fish_seen_subcommand_from probe completion lsp dap trace-lsp preview cov test compile generate-script query doc task help" -f -a generate-script -d 'Generates build script for compilation'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and not __fish_seen_subcommand_from probe completion lsp dap trace-lsp preview cov test compile generate-script query doc task help" -f -a query -d 'Runs language query'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and not __fish_seen_subcommand_from probe completion lsp dap trace-lsp preview cov test compile generate-script query doc task help" -f -a doc -d 'Runs documents'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and not __fish_seen_subcommand_from probe completion lsp dap trace-lsp preview cov test compile generate-script query doc task help" -f -a task -d 'Runs tasks'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and not __fish_seen_subcommand_from probe completion lsp dap trace-lsp preview cov test compile generate-script query doc task help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and __fish_seen_subcommand_from query" -f -a packageDocs -d 'Get the documentation for a specific package'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and __fish_seen_subcommand_from query" -f -a checkPackage -d 'Check a specific package'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and __fish_seen_subcommand_from doc" -f -a new -d 'Declare a document (project input)'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and __fish_seen_subcommand_from doc" -f -a configure -d 'Configure document priority in workspace'
complete -c tinymist -n "__fish_tinymist_using_subcommand help; and __fish_seen_subcommand_from task" -f -a preview -d 'Declare a preview task'
