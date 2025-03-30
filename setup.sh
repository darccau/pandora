#!/usr/bin/env bash

curl https://gist.githubusercontent.com/darccau/4f8b8a24bf321cfbb6329e2811d63bd7/raw/eebeb94912d67fb10c823e0258d1d4d268932959/.vimrc -k -o .vimrc
curl https://gist.githubusercontent.com/darccau/b1cd5ad758a6df8a9b37d8a210100b7b/raw/e90081d0c61ab6018b1c8cd26f3b11666f46e3dd/.tmux.conf -k -o .tmux.conf

mkdir -p logs/{outputs,status,screenshots} notes/{scans,analysis} report

touch notes/index.md notes/references.md notes/tasks.md report/report.md

rm setup.sh
