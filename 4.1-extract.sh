fold=$1

serv_loc="$PWD/fold$fold/integrate/neo4j/servers.py"

echo "Starting neo4j servers for fold $fold"
python $serv_loc --start-all


echo "Starting feature extraction for fold $fold"

cd "fold$fold/learn/all-features"
source activate integrate

jupyter nbconvert --execute 3-extract.ipynb --inplace --ExecutePreprocessor.timeout=-1

echo "Finished feature extraction for fold $fold"

python $serv_loc --stop-all
