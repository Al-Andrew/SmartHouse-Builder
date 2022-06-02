import 'package:flutter/material.dart';
import 'package:homepage/builder.dart';
import './models/schematic.dart';

var DUMMY_SCHEMATICS = [
  Schematic(
    id: '0',
    title: 'Wall',
    linkImg: 'https://i.imgur.com/rqpEfFa.png',
    addFn: () {
      BuilderState.AddNewWall(null);
    },
  ),
  Schematic(
    id: '1',
    title: 'Door',
    linkImg: 'https://i.imgur.com/eCPy7jI.png',
    addFn: () {
      BuilderState.AddNewDoor(null);
    },
  ),
  Schematic(
    id: '2',
    title: 'Window',
    linkImg: 'https://i.imgur.com/tKWeNek.png',
    addFn: () {
      BuilderState.AddNewWindow(null);
    },
  ),
  Schematic(
    id: '3',
    title: 'Save',
    linkImg:
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAbFBMVEX///8BAQEAAACKiopNTU2amppXV1eQkJCXl5fs7Oy4uLhnZ2fIyMirq6sMDAz19fVycnKmpqbQ0NCBgYHv7+/Y2Ng0NDReXl5tbW0XFxdEREQoKChSUlLk5OTDw8M6OjoiIiKxsbEdHR0vLy/FFSgxAAAERklEQVR4nO3da1viMBCGYTJACyxnOSkIuvz//7gU0UWaSZNCyWSu9/lahdz2QC2QtlrllqOXbDUmIywy48M631sGHNZwQ1/FBpW7DGzav8c3G4u0XVcYJ3V9A/G8c6dRDmr5JrskfEVE6xrAeTK+IqJlKHCUFLAgjsKAM18gxcg+kJcm1mBxIOt1n1tvyhk7/kDffZA+hmGbxoOaH+3Ere/LxsQXOG3U4eqF2VI9X/13nsBNswpnHNHrkDrwBL42rXDGbKg09/hd32203onEoxraR0lUfS4+8z2MPoHhilkRHqdwnv8nUfYMhqMNM87K135m7ZcfKOgFtoF63ECJZs5f5P40pcdpNzHsPnseU9r2WOGJ2HU9h/fpmlyhm7j0PeFuSsg9XYjQSRypELqI9nOF5IQOYqZEyBNXWoQs0fu6qHgh97po9AhPxE/LU3hfnUlAaD9H9QUmITwRyxchdAlt/xIrE56I78qF5Ws36oSGxtqFhg7aheb3+zYahYZy9cLrC3Aqhb8OqDqFhrbahVeXBtUKf07ftAoNfWgXmu9L4YqFpF34/RCahR31QtIuNF/vD6sWfqoXdtULc/XCNoQQQgghhBBCCCGEEEIIIYQQQgghhBBCCCGEgoSP+EaJZOEi+2NvXfoobPPC2N/syhsXvkUWrhsXUu35Nh5T+JQIgULj/gpc43l/QesOYdyVWGNWi1ChoWNE4Fs4MFxoaHvX9D53tDjUANYQnjbU9u1n/Z9RP6838UoN4Xlmk1323Ha1Z3aqI7wgn1wtXn1hQkGYfhCmH4TpB2H6QZh+EKYfhOkHYfpBmH4Qph+El58S3d3C4kE6cltVGKuFkS7iBzR8cxkrhbSK9UZMQJ8OYpXwZiIbqTnmIq8QRn9X2zd+HuQqoXvqWkFt2U8dOYXRp372j32Hv0IYe+pn//hPjrmFjXwEqpm4Y02FMK96XDlBCKH8IIRQfhBCKD8IIZQfhBDKD0II5QchhPKDEEL5QQih/CCEUH4QQig/CCGUH4QQyg9CCOUHIYTygxBC+UEIofwghFB+EEIoPwghlB+EEMoPQgjlByGE8oMQQvlBCKH83EJ2XhA1QsMtVSN81SzsFUu5+7eoEI6KpRvNwn2xlLvXlwrheT69vV7hZTIvbhopDcLLZF4fzGIFwsuMc8yOmL6QaPG1uM8sj327w4AYwe57eWZf3ok55qDema3w5y6YS2YdJzIxZKvVtQOu7oPHrMRkdkRmI726kal9TyRKYH7WorYd+GveR/sMoPSaxHZqn4T2difbMbviPNKoA2ozwP3Nz/1liOuh6PXYn42ZnbB0EFlwL5risw3b0NTy12DPzyXHDdkCbLUm7Gy8qUXs69y0/s0iJVU+yPxvz673dCLKnMfGPG3jafTH0i3Zb+uO+T1YdsW4d5W+omX7GPHoeEfZbOHjOzdZDmZ5O6F6o73wmzgg5OofvmyAAO6eMbMAAAAASUVORK5CYII=',
    addFn: () {
      BuilderState.SaveSetup();
    },
  ),
  Schematic(
    id: '4',
    title: 'Delete',
    linkImg:
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAYFBMVEX///8AAABhYWHc3NwwMDDCwsKmpqbi4uLv7+/FxcXNzc2hoaH8/PzZ2dn5+fn09PRXV1fS0tJqampNTU3p6ekpKSmFhYV3d3eysrIeHh4SEhJ9fX1AQEAICAhFRUVYWFhkzh3jAAABkklEQVR4nO3d3U7CQBCA0SIgv6VABVFR3/8tTYgSrzRt6UxKzvcC25Ptdnq3RSFJkiRJkiRJknTnLQ+TJh0W2Q/ctOWoaQMjNgcOjNgGOChiO+CAiG2BgyG2Bw6E2AU4CGI3YD5xs3r8u1VH4Gj07wpVr8J5Z0D3ZoSEhOkREhLmR0hImB8hIWF+hN1al+Psyk2vQkmS9LvdNLZduHAb/K+2DRc+BAsfCAkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQcl3N+98BgsfA4XnoKFq3BhGSyMv0ln/RIKfK3ChcVbqHAfDyzGocL4l7SInYh1BrCYBQrLFGHgSIwfht/VQcDzOktYxUyM96csYNRRTPmO/lSde/dNEnfwUt+Df592Bq/t+rwJ8WOZzbu0+OzJV0+zadc20+N2ctvq42mezZIkSZIkSZIkSbppX+vZUiqtrHpEAAAAAElFTkSuQmCC',
    addFn: () {
      BuilderState.DeleteSelected();
    },
  ),
];
