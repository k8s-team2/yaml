kubectl patch pv mysql-pv -p '{"metadata":{"finalizers":null}}' -n database-ns
kubectl patch pvc mysql-pvc -p '{"metadata":{"finalizers":null}}' -n database-ns
kubectl patch pv mongo-pv -p '{"metadata":{"finalizers":null}}' -n database-ns
kubectl patch pvc mongo-pvc -p '{"metadata":{"finalizers":null}}' -n database-ns

kubectl delete namespace frontend-ns
kubectl delete namespace backend-ns
kubectl delete namespace database-ns