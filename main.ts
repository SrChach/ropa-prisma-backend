import { PrismaClient, Prisma } from '@prisma/client'
import express from 'express'

const prisma = new PrismaClient()

const app = express()
app.use(express.json())

app.get('/', (req, res) => {
  res.json({ message: 'API para app de ropa. Checar los endpoints de la app' })
})

// TODO: pending validation of all fields. Move to graphql

app.post(`/client`, async (req, res) => {
  const { name, lastName, lastName2 } = req.body

  const result = await prisma.client.create({
    data: {
      name,
      lastName,
      lastName2
    },
  })
  res.json(result)
})

app.get('/clients', async (req, res) => {
  const users = await prisma.client.findMany({ take: 50 })
  res.json(users)
})

app.post("/color", async (req, res) => {
  const { name, hexCode } = req.body

  const result = await prisma.color.create({
    data: {
      name,
      hexCode
    },
  })
  res.json(result)
})

app.get('/colors', async (req, res) => {
  const colors = await prisma.color.findMany({ take: 50 })
  res.json(colors)
})

app.post("/size", async (req, res) => {
  const { name, shortname } = req.body

  const result = await prisma.size.create({
    data: {
      name,
      shortname
    },
  })
  res.json(result)
})

app.get('/sizes', async (req, res) => {
  const sizes = await prisma.size.findMany({ take: 50 })
  res.json(sizes)
})

app.post("/cloth/type", async (req, res) => {
  const { name } = req.body

  const result = await prisma.clothType.create({
    data: { name },
  })
  res.json(result)
})

app.get('/cloth/types', async (req, res) => {
  const clothTypes = await prisma.clothType.findMany({ take: 50 })
  res.json(clothTypes)
})


const server = app.listen(3000, () =>
  console.log(`
    🚀 Server ready at: http://localhost:3000
  `),
)
