# Instalar paquetes si no están instalados
if (!require(tm)) install.packages("tm")
if (!require(wordcloud)) install.packages("wordcloud")

# Cargar paquetes
library(tm)
library(wordcloud)

# Crear un corpus con textos sobre el aula invertida
textos <- c("El aula invertida es una metodología pedagógica que propone que el proceso de aprendizaje se realice fuera del aula, a través de recursos como videos o lecturas, y que dentro del aula se realicen actividades de refuerzo y aplicación de lo aprendido.",
            "La clave del éxito del aula invertida radica en la preparación adecuada de los materiales previos al encuentro presencial, así como en el diseño de actividades que permitan a los estudiantes aplicar los conocimientos práctica.",
            "El modelo de aula invertida busca fomentar la autonomía y responsabilidad de los estudiantes en su proceso de aprendizaje, al tiempo que permite al docente centrarse en guiar y apoyar el proceso, en lugar de en la transmisión directa de conocimientos.",
            "Es un modelo de aprendizaje presencial o mixto, el cual tiene el objetivo hacer clases más dinámicas para motivar a los alumnos, al combinar los proyectos en clase con trabajos en casa.",
            "El aula invertida, también conocida como Flipped Classroom, es un modelo pedagógico que invierte el orden tradicional de una clase. En lugar de que el profesor imparta la teoría en el aula y los estudiantes la practiquen en casa, el aula invertida propone que los estudiantes aprendan los conceptos de forma autónoma antes de la clase presencial, utilizando recursos digitales como vídeos, presentaciones, lecturas",
            "De esta manera, el tiempo en el aula se dedica a actividades más interactivas y colaborativas, como debates, resolución de problemas, proyectos grupales. Esto permite a los profesores personalizar el aprendizaje y atender a las necesidades individuales estudiante.",
            "Aprendizaje autónomo: Los estudiantes son responsables de su aprendizaje y gestionan su tiempo para estudiar los contenidos antes de la clase.",
            " tecnología: Se utilizan recursos digitales para facilitar el aprendizaje previo a la clase.",
            "Actividades interactivas: El tiempo en el aula se  actividades que fomentan la interacción entre los estudiantes y el profesor.",
            "Aprendizaje personalizado: El profesor puede adaptar las actividades y el ritmo de la clase a las necesidades de estudiante.",
            "Flipped-Classroom Flipped-Classroom  Flipped-Classroom  Flipped-Classroom Flipped-Classroom  Flipped-Classroom, casa, casa, aula, aula, aula, trabajo, trabajo, trabajo, independiente, independiente, autonomía, autonomía, acompañamiento, acompañaniento, seguimiento, material, TICs, TC¡ICs"
)

# Crear un corpus
corpus <- Corpus(VectorSource(textos))

# Preprocesar el texto
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("spanish"))
corpus <- tm_map(corpus, stripWhitespace)

# Crear una matriz de términos
dtm <- TermDocumentMatrix(corpus)

# Convertir la matriz de términos en una lista de palabras
m <- as.matrix(dtm)
words <- sort(rowSums(m), decreasing=TRUE)

# Crear la nube de palabras
wordcloud(words = names(words), freq = words, min.freq = 1,
          scale = c(5, 3), max.words = 50, random.order = FALSE,
          # colors = brewer.pal(9, "Blues")[5:12]
          colors = brewer.pal(5, "Dark2")
          )
