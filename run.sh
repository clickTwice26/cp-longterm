#!/bin/bash

# Smart C++ Runner for macOS
# Watches for file changes, compiles, runs, and cleans up

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the source file (first argument or default to test.cpp)
SOURCE_FILE="${1:-test.cpp}"

# Check if source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo -e "${RED}Error: Source file '$SOURCE_FILE' not found${NC}"
    exit 1
fi

# Extract filename without extension
FILENAME="${SOURCE_FILE%.*}"
EXECUTABLE="./${FILENAME}.out"

# Function to compile and run
compile_and_run() {
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${YELLOW}[$(date '+%H:%M:%S')] Compiling $SOURCE_FILE...${NC}"
    
    # Compile with g++
    if g++ -std=c++17 -O2 -Wall "$SOURCE_FILE" -o "$EXECUTABLE" 2>&1; then
        echo -e "${GREEN}✓ Compilation successful${NC}"
        echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "${YELLOW}[$(date '+%H:%M:%S')] Running program...${NC}"
        echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        
        # Run the program
        $EXECUTABLE
        EXIT_CODE=$?
        
        echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        if [ $EXIT_CODE -eq 0 ]; then
            echo -e "${GREEN}✓ Program exited successfully (exit code: $EXIT_CODE)${NC}"
        else
            echo -e "${RED}✗ Program exited with code: $EXIT_CODE${NC}"
        fi
        
        # Clean up executable
        rm -f "$EXECUTABLE"
        echo -e "${GREEN}✓ Cleaned up executable${NC}"
    else
        echo -e "${RED}✗ Compilation failed${NC}"
        return 1
    fi
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
}

# Function to clean up all build artifacts
cleanup_all() {
    echo -e "${YELLOW}Cleaning up all build artifacts...${NC}"
    rm -f *.out *.o a.out
    echo -e "${GREEN}✓ Cleanup complete${NC}"
}

# Check if fswatch is available for watch mode
if command -v fswatch &> /dev/null; then
    echo -e "${GREEN}Smart C++ Runner - Watch Mode${NC}"
    echo -e "${BLUE}Watching: $SOURCE_FILE${NC}"
    echo -e "${YELLOW}Press Ctrl+C to stop${NC}"
    echo ""
    
    # Initial compile and run
    compile_and_run
    
    # Watch for changes
    fswatch -o "$SOURCE_FILE" | while read f; do
        echo -e "${YELLOW}[$(date '+%H:%M:%S')] File changed, recompiling...${NC}"
        compile_and_run
    done
else
    echo -e "${YELLOW}Note: Install fswatch for auto-reload: brew install fswatch${NC}"
    echo -e "${GREEN}Running once...${NC}"
    echo ""
    compile_and_run
fi

# Cleanup on exit
trap cleanup_all EXIT
