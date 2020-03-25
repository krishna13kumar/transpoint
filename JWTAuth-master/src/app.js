const express = require('express')
const userRouter = require('./routers/user')
const port = 3000
require('./db/db')
const app = express()

app.use(express.json())
app.use(userRouter)

app.listen(process.env.PORT || port, () => {
    console.log(`Server running on port ${port}`)
})