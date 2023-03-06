# Test technique Swile
J'ai effectué le test en utilisant **SwiftUI** et les frameworks **TCA** et **Alamofire**.
J'utilise **Swiftlint** pour formater le code.
L'app est disponible en **Anglais** et en **Français**
J'ai utilisé la police **Graphik** comme dans l'app Swile, (la maquette utilise le police Segma mais pas trouvable gratuitement)

  
# Remarques
**JSON :** J'ai dû générer un id pour faire fonctionner les animations avec les matchedGeometryObject. J'ai utilisé le timestamp de la date de la transaction comme id (suffisant pour ce test).  J'aurais également pu générer un uuid.  

**Icônes**: J'ai utilisé deux masques sur les icônes pour être fidèle à la maquette. Un masque pour la forme du background de couleur et un autre pour la bordure.

**Infinite scroll:** A chaque requête de page supplémentaire, je modifie les résultats reçus pour que les dates soient antérieures, afin qu'elles soient placées en dessous des résultats précédents.

**Tests :** J'ai écris quelques tests unitaire, en utilisant les méthodes de test de TCA.
