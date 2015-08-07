library(rrdf)
store = new.rdf()
add.prefix(store,
  prefix="dc",
  namespace="http://purl.org/dc/terms/"
  )

add.triple(store,
  subject="dc:Subject",
  predicate="dc:Predicate",
  object="dc:Object")

cat(asString.rdf(store))
