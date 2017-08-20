FROM daonv/vapor-pro:latest
LABEL name=daonv/vapor-pro version=latest
MAINTAINER dao.nguyen@asiantech.vn

ADD ./.build/release/Run /vapor/
ADD ./.build/release/*.so /vapor/
COPY ./Config /vapor/Config
COPY ./Resources /vapor/Resources
COPY ./Public /vapor/Public

EXPOSE 8080

CMD ["echo", "CFTR-API production image"]

# To launch app:
# CMD ["./Run", "serve --env=production"]
