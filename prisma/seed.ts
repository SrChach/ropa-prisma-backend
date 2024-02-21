import { PrismaClient, Prisma } from '@prisma/client'

const prisma = new PrismaClient()

const clientData: Prisma.ClientCreateInput[] = [
  {
    name: "Andrea Sarai",
    lastName: "Mendoza"
  },
  {
    name: "Ignacio",
    lastName: "Martinez",
    lastName2: "Avila"
  },
  {
    name: "Maxwell",
    lastName: "Vecino1"
  },
]

async function main() {
  console.log(`Start seeding ...`)
  for (const u of clientData) {
    const user = await prisma.client.create({
      data: u,
    })
    console.log(`Created user with id: ${user.id}`)
  }
  console.log(`Seeding finished.`)
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })