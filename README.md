# factors
A very simple API for getting factors of a number.

1. Run `bundle install` to install the required gems.
1. The Procfile can be used to deploy to Heroku.

Going to /api will give a JSON response with the current year's factors. You can append a `?q=` to the end to get factors of whatever number you like.

For instance:
<br />
`localhost:4567/api?q=360` will return
<br />
`{"factors":[1,2,3,4,5,6,8,9,10,12,15,18,20,24,30,36,40,45,60,72,90,120,180,360]}`
