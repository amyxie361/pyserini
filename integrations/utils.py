#
# Pyserini: Reproducible IR research with sparse and dense representations
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

import os
import subprocess
import shutil


def clean_files(files):
    for file in files:
        if os.path.exists(file):
            if os.path.isdir(file):
                shutil.rmtree(file)
            else:
                os.remove(file)


def run_command(cmd, echo=False):
    process = subprocess.Popen(cmd.split(),
                               stdout=subprocess.PIPE,
                               stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()
    stdout = stdout.decode('utf-8')
    stderr = stderr.decode('utf-8')
    if stderr and echo:
        print(stderr)
    if echo:
        print(stdout)
    return stdout, stderr


# Function for parsing the output from pyserini.eval.trec_eval
def parse_score(output, metric, digits=4):
    lines = output.split('\n')
    # The output begins with a bunch of debug information, get rid of lines until we get to 'Results'
    while 'Results' not in lines[0]:
        lines.pop(0)

    for line in lines:
        if metric in line:
            score = float(line.split()[-1])
            return round(score, digits)
    return None


# Function for parsing the output from pyserini.eval.evaluate_dpr_retrieval
def parse_score_qa(output, metric, digits=4):
    for line in output.split('\n'):
        if metric in line:
            score = float(line.split()[-1])
            return round(score, digits)
    return None


# Function for parsing the output from MS MARCO eval scripts
# (Currently, parses the same way as parse_score_qa above, but keeping separate in case they diverge in the future.)
def parse_score_msmarco(output, metric, digits=4):
    for line in output.split('\n'):
        if metric in line:
            score = float(line.split()[-1])
            return round(score, digits)
    return None
