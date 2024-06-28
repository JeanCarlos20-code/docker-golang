FROM golang:onbuild AS build
WORKDIR /usr/src/app
COPY . .
RUN go build -o main .

FROM scratch
COPY --from=build /usr/src/app .
CMD [ "./main" ]