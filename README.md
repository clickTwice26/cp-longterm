# Smart C++ Runner

A comprehensive Python-based C++ runner for macOS that automatically compiles, runs, and cleans up your C++ programs.

## Features

✅ **Automatic compilation** with g++ (or clang++)  
✅ **Automatic execution** and output display  
✅ **Auto-cleanup** of build artifacts (*.out, *.o, a.out)  
✅ **Watch mode** - automatically recompiles when files change  
✅ **Optional comprehensive logging** to dedicated logs folder  
✅ **Execution time tracking**  
✅ **Color-coded output** for easy reading  
✅ **Error tracking** and detailed compilation/runtime logs

## Quick Start

### Default Mode (Quiet - No Logs)
Just compile and run - shows only program output and execution time:
```bash
python3 cpp_runner.py test.cpp
```

**Output:**
```
▶ Running...
Hello World
⏱  Execution time: 0.147s
```

### With Detailed Logs
Enable comprehensive logging to `logs/` directory:
```bash
python3 cpp_runner.py test.cpp -l
```

Shows compilation steps, execution details, and creates timestamped log files.

### Watch Mode
Auto-recompile and run when file changes:
```bash
python3 cpp_runner.py test.cpp -w
```

Add `-l` for logs in watch mode:
```bash
python3 cpp_runner.py test.cpp -w -l
```

## Usage

```bash
python3 cpp_runner.py <source_file> [options]
```

### Options

- `-w, --watch` - Watch mode: auto-recompile on file changes
- `-l, --logs` - Enable detailed logging to logs/ directory
- `-c, --compiler` - Compiler to use (default: g++)
- `-s, --std` - C++ standard (default: c++17)
- `-o, --optimization` - Optimization level (default: O2)

### Examples

```bash
# Quiet run (default)
python3 cpp_runner.py test.cpp

# With logs
python3 cpp_runner.py test.cpp -l

# Watch mode
python3 cpp_runner.py test.cpp -w

# Watch mode with logs
python3 cpp_runner.py test.cpp -w -l

# Use clang++ compiler
python3 cpp_runner.py test.cpp -c clang++

# Use C++20 standard
python3 cpp_runner.py test.cpp -s c++20

# Custom optimization
python3 cpp_runner.py test.cpp -o O3
```

## Log Files

When logs are enabled (`-l` flag), the following files are created in the `logs/` directory:

- `runner_TIMESTAMP.log` - Main log with all activities
- `compile_TIMESTAMP.log` - Compilation commands and output
- `runtime_TIMESTAMP.log` - Program execution output and timing
- `errors_TIMESTAMP.log` - Compilation and runtime errors
- `latest.log` - Symlink to the most recent main log

## What Gets Cleaned Up

The runner automatically removes:
- `*.out` files (compiled executables)
- `*.o` files (object files)
- `a.out` (default g++ output)

## Requirements

- Python 3.6+
- g++ or clang++ compiler
- macOS (tested on macOS)

## Tips

1. **For competitive programming**: Use default quiet mode for quick testing
   ```bash
   python3 cpp_runner.py solution.cpp
   ```

2. **For debugging**: Enable logs to see detailed compilation and execution info
   ```bash
   python3 cpp_runner.py solution.cpp -l
   ```

3. **For development**: Use watch mode to auto-compile as you code
   ```bash
   python3 cpp_runner.py main.cpp -w
   ```

4. **For macOS without bits/stdc++.h**: Use standard headers like `<iostream>` instead

## Troubleshooting

### bits/stdc++.h not found
This header is not available on macOS. Use standard headers instead:
```cpp
#include <iostream>
#include <vector>
#include <algorithm>
// ... etc
```

### Permission denied
Make the script executable:
```bash
chmod +x cpp_runner.py
./cpp_runner.py test.cpp
```
