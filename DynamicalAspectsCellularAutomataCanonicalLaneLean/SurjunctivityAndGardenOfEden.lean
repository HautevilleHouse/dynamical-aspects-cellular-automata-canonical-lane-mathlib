import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure SurjunctivityPackage (S : Type) (CA : CellularAutomaton S ℕ) where
  surjectivity : Prop
  injectivity : Prop
  surjunctivityHolds : Prop
  gardenOfEdenTheorem : Prop
  preimagesFinite : Prop

structure GardenOfEdenPackage (S : Type) (CA : CellularAutomaton S ℕ) (surj : SurjunctivityPackage S CA) where
  gardenOfEdenConfigs : Set (ℕ → S)
  nonexistenceOfPreimages : Prop
  finitenessGardenOfEden : Prop

structure SurjunctivityEvidence {S : Type} {CA : CellularAutomaton S ℕ}
    (P : SurjunctivityPackage S CA) where
  surjectivityClosed : P.surjectivity ↔ P.injectivity
  gardenOfEdenTheoremClosed : P.gardenOfEdenTheorem

def SurjunctivityClosed {S : Type} {CA : CellularAutomaton S ℕ}
    (P : SurjunctivityPackage S CA) : Prop :=
  (P.surjectivity ↔ P.injectivity) ∧ P.gardenOfEdenTheorem

theorem surjunctivity_closed_from_evidence {S : Type} {CA : CellularAutomaton S ℕ}
    (P : SurjunctivityPackage S CA) (E : SurjunctivityEvidence P) :
    SurjunctivityClosed P := by
  exact And.intro E.surjectivityClosed E.gardenOfEdenTheoremClosed

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse