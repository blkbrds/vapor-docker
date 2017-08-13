FROM vapor-pro
LABEL name=vapor version=1.0.9-xenial
MAINTAINER dao.nguyen@asiantech.vn

ADD ./.build/release/Run /vapor/
ADD ./.build/release/*.so /vapor/
COPY ./Config /vapor/Config
COPY ./Resources /vapor/Resources

EXPOSE 8080

CMD ["echo", "CFTR-API production image"]

# To launch app:
# CMD ["./Run", "serve --env=production"]
