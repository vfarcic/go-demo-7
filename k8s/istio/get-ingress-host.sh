PROVIDER=$1

if [[ "$PROVIDER" == "minikube" ]]; then
    export INGRESS_PORT=$(kubectl \
        --namespace istio-system \
        get service istio-ingressgateway \
        --output jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
    export INGRESS_HOST=$(minikube ip):$INGRESS_PORT
elif [[ "$PROVIDER" == "docker" ]]; then
    export INGRESS_HOST=127.0.0.1
elif [[ "$PROVIDER" == "eks" ]]; then    
    export INGRESS_HOST=$(kubectl \
        --namespace istio-system \
        get service istio-ingressgateway \
        --output jsonpath="{.status.loadBalancer.ingress[0].hostname}")
else
    export INGRESS_HOST=$(kubectl \
        --namespace istio-system \
        get service istio-ingressgateway \
        --output jsonpath="{.status.loadBalancer.ingress[0].ip}")
fi

echo $INGRESS_HOST