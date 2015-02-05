### Rest Api to cab service

### Tools
- Sinatra
- Active Records
- Json
- Geocoder
- Sqlite

### How to run

```bash
$ bundle
$ rake db:migrate
$ rake db:seed
$ rackup
```

### To return a cab next location
- `POST /ride/cabs_near`

```bash
$ curl -i -H 'Accept: application/json' \
       -d 'address=Av+Paulista' http://localhost:9292/cab/cabs_near"
```


### To get all passenger or cab
- `GET /passenger/`
- `GET /cab/`

```bash
$ curl -i -H 'Accept: application/json' http://localhost:9292/passenger/
$ curl -i -H 'Accept: application/json' http://localhost:9292/cab/

```

### To add a new cab or passanger
- `POST /passenger/new`
- `POST /cab/new`

```bash
$ curl -i -H 'Accept: application/json' \
       -d 'name=Juca&email=juca@taxi.org&password=password&address=Av+São+João' \
       http://localhost:9292/passenger/new
```

### To edit a cab or passenger
- `PATCH /passenger/id`
- `PATCH /cab/id`

```bash
$ curl -i -H 'Accept: application/json' \
       -d 'address=Rua+Augusta' http://localhost:9292/passenger/id
```


### To delete a cab or passenger
- `DELETE /passenger/id`
- `DELETE /cab/id`

```bash
$ curl -i -H 'Accept: application/json'  -X DELETE \
        http://localhost:9292/passenger/id
```


### To add a new ride
- `POST /ride/new`

```bash
$ curl -i -H 'Accept: application/json' \
       -d 'cab_id=2&passanger_id=1&starts_at=AV+Brigadeiro+Faria+Lima&ends_at=Av+São+João' \
       http://localhost:9292/ride/new
```
### To do
- More test
- Add Simulation rides price