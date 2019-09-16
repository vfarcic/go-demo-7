FROM scratch
EXPOSE 8080
ENTRYPOINT ["/go-demo-7"]
COPY ./bin/ /