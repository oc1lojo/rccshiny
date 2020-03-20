rccShiny
========

[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/h81m5d2ie1p7tqt2/branch/master?svg=true)](https://ci.appveyor.com/project/oc1lojo/rccshiny)
[![Travis build
status](https://travis-ci.org/oc1lojo/rccshiny.svg?branch=master)](https://travis-ci.org/oc1lojo/rccshiny)

Shiny möjliggör skapandet av webbapplikationer med R. Paketet `rccShiny`
är en RCC implementering vars syfte är att skapa ett komplement till
årsrapporterna där slutanvändaren själv kan välja selektionskriterier
och format på statistiken på ett flexibelt sätt.

Installation
------------

``` r
if (!requireNamespace("remotes")) {
  install.packages("remotes")
}

remotes::install_bitbucket("cancercentrum/rccshiny")
```

Användning
----------

Ladda paketet.

``` r
library(rccShiny)
```

Läs hjälpfil.

``` r
?rccShiny::rccShiny2
```

För fler exempel, se t.ex. R-koden för för Bröstcancerregistrets
interaktiva rapporter
(<a href="http://statistik.incanet.se/brostcancer/" class="uri">http://statistik.incanet.se/brostcancer/</a>)
på
<a href="https://bitbucket.org/cancercentrum/nkbc-arsrapportshiny" class="uri">https://bitbucket.org/cancercentrum/nkbc-arsrapportshiny</a>
.
