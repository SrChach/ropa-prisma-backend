import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

async function main () {
  // const client = await prisma.client.create({ data : {
  //   name: "Ignacio",
  //   lastName: "Martinez",
  //   lastName2: "Avila"
  // }})
  // console.log(client)
  const users = await prisma.client.findMany()
  console.log(users)
}

main()
  .catch((e) => {
    console.error(e.message)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })

