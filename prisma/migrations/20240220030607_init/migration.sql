-- CreateTable
CREATE TABLE "Color" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "hexCode" TEXT,

    CONSTRAINT "Color_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Size" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Size_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClothType" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "ClothType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cloth" (
    "id" UUID NOT NULL,

    CONSTRAINT "Cloth_pkey" PRIMARY KEY ("id")
);
