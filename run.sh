## create the cluster
gcloud dataproc clusters create cluster-a35a --enable-component-gateway --region europe-west1 --zone europe-west1-c --master-machine-type n1-standard-4 --master-boot-disk-size 500 --num-workers 2 --worker-machine-type n1-standard-4 --worker-boot-disk-size 500 --image-version 2.0-debian10 --project fluid-tangent-180520

## copy data
gsutil cp page_links_en.nt.bz2 gs://ruorandong/

## copy pig code
gsutil cp dataproc.py.txt gs://ruorandong/

## Clean out directory
gsutil rm -rf gs://ruorandong/out


## run
gcloud dataproc jobs submit pig --region europe-west1 --cluster cluster-a35a -f gs://ruorandong/dataproc.py

## access results
gsutil cat gs://ruorandong/out/pagerank_data_10/part-r-00000

## delete cluster...
gcloud dataproc clusters delete cluster-a35a --region europe-west1
