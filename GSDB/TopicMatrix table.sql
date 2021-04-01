CREATE TABLE TopicMatrix
(
  Topic VARCHAR(50) NOT NULL,
  ModuleName VARCHAR(50)NOT NULL,
  Bas BIT,
  Inter BIT,
  Expert BIT,
  Marks INT NOT NULL,
  PsNumber BIGINT NOT NULL,
  CONSTRAINT FK_Topic_Trainees FOREIGN KEY(PsNumber) REFERENCES Trainees(PSnumber)
  

)
select * from TopicMatrix
Drop Table TopicMatrix