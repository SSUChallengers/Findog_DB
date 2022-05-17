-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/nS64AK
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `User` (
    `userId` int AUTO_INCREMENT NOT NULL ,
    `email` varchar(30)  NOT NULL ,
    `nickname` varchar(20)  NOT NULL ,
    `password` varchar(400)  NOT NULL ,
    `phoneNum` varchar(15)  NOT NULL ,
    `profileUrl` text  NULL ,
    `userStatus` varchar(10)  NOT NULL DEFAULT 'active',
    `userCreateAt` timestamp  NOT NULL DEFAULT current_timestamp,
    `userUpdateAt` timestamp  NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (
        `userId`
    )
);

CREATE TABLE `Animal` (
    `animalId` int AUTO_INCREMENT NOT NULL ,
    `desertionNo` varchar(15)  NOT NULL ,
    `filename` varchar(200)  NOT NULL ,
    `happenDt` varchar(10)  NOT NULL ,
    `happenPlace` varchar(100)  NOT NULL ,
    `kindCd` varchar(50)  NOT NULL ,
    `colorCd` varchar(30)  NOT NULL ,
    `age` varchar(30)  NOT NULL ,
    `weight` varchar(30)  NOT NULL ,
    `noticeNo` varchar(30)  NOT NULL ,
    `noticeSdt` varchar(10)  NOT NULL ,
    `noticeEdt` varchar(10)  NOT NULL ,
    `popfile` varchar(200)  NOT NULL ,
    `processState` varchar(10)  NOT NULL ,
    `sexCd` varchar(1)  NOT NULL ,
    `neuterYn` varchar(1)  NOT NULL ,
    `specialMark` varchar(200)  NOT NULL ,
    `careNm` varchar(50)  NOT NULL ,
    `careTel` varchar(14)  NOT NULL ,
    `careAddr` varchar(200)  NOT NULL ,
    `orgNm` varchar(30) NOT NULL,
    PRIMARY KEY (
        `animalId`
    )
);

CREATE TABLE `Post` (
    `postId` int AUTO_INCREMENT NOT NULL ,
    `userId` int  NOT NULL ,
    `title` varchar(70)  NOT NULL ,
    `content` text  NOT NULL ,
    `hits` int  NOT NULL ,
    `postCreateAt` timestamp  NOT NULL DEFAULT current_timestamp,
    `postUpdateAt` timestamp  NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (
        `postId`
    )
);

CREATE TABLE `Like` (
    `likeId` int AUTO_INCREMENT NOT NULL ,
    `userId` int  NOT NULL ,
    `animalId` int  NULL ,
    `postId` int  NULL ,
    `likeCreateAt` timestamp  NOT NULL DEFAULT current_timestamp,
    `likeUpdateAt` timestamp  NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (
        `likeId`
    )
);

CREATE TABLE `Comment` (
    `commentId` int AUTO_INCREMENT NOT NULL ,
    `parentCommentId` int  NOT NULL ,
    `userId` int  NOT NULL ,
    `postId` int  NOT NULL ,
    `content` text  NOT NULL ,
    'commentStatus' varchar(10) NOT NULL DEFAULT 'active',
    `commentCreateAt` timestamp  NOT NULL DEFAULT current_timestamp,
    `commentUpdateAt` timestamp  NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (
        `commentId`
    )
);

CREATE TABLE `Image` (
    `imageId` int AUTO_INCREMENT NOT NULL ,
    `postId` int  NOT NULL ,
    `imgUrl` text  NOT NULL ,
    `imageCreateAt` timestamp  NOT NULL DEFAULT current_timestamp,
    `imageUpdateAt` timestamp  NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (
        `imageId`
    )
);

ALTER TABLE `Post` ADD CONSTRAINT `fk_Post_userId` FOREIGN KEY(`userId`)
REFERENCES `User` (`userId`);

ALTER TABLE `Like` ADD CONSTRAINT `fk_Like_userId` FOREIGN KEY(`userId`)
REFERENCES `User` (`userId`);

ALTER TABLE `Like` ADD CONSTRAINT `fk_Like_animalId` FOREIGN KEY(`animalId`)
REFERENCES `Animal` (`animalId`);

ALTER TABLE `Like` ADD CONSTRAINT `fk_Like_postId` FOREIGN KEY(`postId`)
REFERENCES `Post` (`postId`);

ALTER TABLE `Comment` ADD CONSTRAINT `fk_Comment_userId` FOREIGN KEY(`userId`)
REFERENCES `User` (`userId`);

ALTER TABLE `Comment` ADD CONSTRAINT `fk_Comment_postId` FOREIGN KEY(`postId`)
REFERENCES `Post` (`postId`);

ALTER TABLE `Image` ADD CONSTRAINT `fk_Image_postId` FOREIGN KEY(`postId`)
REFERENCES `Post` (`postId`);

