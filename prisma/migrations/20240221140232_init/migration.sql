/*
  Warnings:

  - The primary key for the `Color` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Color` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Size` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Size` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Added the required column `active` to the `Cloth` table without a default value. This is not possible if the table is not empty.
  - Added the required column `clothTypeId` to the `Cloth` table without a default value. This is not possible if the table is not empty.
  - Added the required column `colorId` to the `Cloth` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sizeId` to the `Cloth` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Cloth` table without a default value. This is not possible if the table is not empty.
  - Added the required column `shortname` to the `Size` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Cloth" ADD COLUMN     "active" BOOLEAN NOT NULL,
ADD COLUMN     "clothTypeId" UUID NOT NULL,
ADD COLUMN     "colorId" INTEGER NOT NULL,
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "sizeId" INTEGER NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Color" DROP CONSTRAINT "Color_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Color_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Size" DROP CONSTRAINT "Size_pkey",
ADD COLUMN     "shortname" TEXT NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Size_pkey" PRIMARY KEY ("id");

-- CreateTable
CREATE TABLE "Client" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "lastName2" TEXT,

    CONSTRAINT "Client_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rental" (
    "id" SERIAL NOT NULL,
    "rentDate" TIMESTAMP(3) NOT NULL,
    "devolutionDate" TIMESTAMP(3) NOT NULL,
    "clientId" UUID NOT NULL,
    "clothId" UUID NOT NULL,

    CONSTRAINT "Rental_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Cloth" ADD CONSTRAINT "Cloth_colorId_fkey" FOREIGN KEY ("colorId") REFERENCES "Color"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cloth" ADD CONSTRAINT "Cloth_sizeId_fkey" FOREIGN KEY ("sizeId") REFERENCES "Size"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cloth" ADD CONSTRAINT "Cloth_clothTypeId_fkey" FOREIGN KEY ("clothTypeId") REFERENCES "ClothType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rental" ADD CONSTRAINT "Rental_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rental" ADD CONSTRAINT "Rental_clothId_fkey" FOREIGN KEY ("clothId") REFERENCES "Cloth"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
