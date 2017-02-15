A = load 'ExampleDataSet' using PigStorage(',') as (id:int, firstname:chararray, lastname:chararray, age:int, skill:chararray, address:chararray);

B = foreach A generate id, CONCAT(firstname,' ',lastname) as name;

C = foreach B generate TOKENIZE(name, ' ') as words;

D = group A all;

E = foreach D generate MIN(A.age);

F = foreach D generate MIN(A.age);

G = order A by age;

H = limit G 1;

I = foreach C generate FLATTEN(words);

store ordrE into 'pigoutputI';
