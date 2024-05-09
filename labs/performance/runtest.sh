#!/bin/bash

# Source the parameters file
source benchmark.parameters

# Run the command
python -m azure-openai-benchmark.benchmark.bench load \
  --deployment $AOAI_DEPLOYMENT \
  --rate $RATE \
  --shape-profile custom \
  --context-tokens $CONTEXT_TOKENS \
  --max-tokens $MAX_TOKENS \
  --retry $RETRY \
  $AOAI_ENDPOINT \
  --duration $DURATION \
  --output-format jsonl | tee $TEST_NAME.log 2> $ERROR_FILE
