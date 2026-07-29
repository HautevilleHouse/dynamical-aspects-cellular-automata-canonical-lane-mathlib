import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure InvariantMeasurePackage (S : Type) (CA : CellularAutomaton S ℕ) (C : ConfigSpace S CA) where
  spaceOfMeasures : Type
  invariantMeasures : Set spaceOfMeasures
  ergodicMeasures : Set spaceOfMeasures
  variationalPrinciple : Prop

structure TopologicalEntropyPackage (S : Type) (CA : CellularAutomaton S ℕ) (C : ConfigSpace S CA) where
  growthRateFunction : (ℕ → S) → ℕ → ℝ
  entropyValue : ℝ
  entropyUpperBound : Prop
  entropyComputed : entropyValue = 0 ∨ entropyValue > 0

structure InvariantMeasureEvidence {S : Type} {CA : CellularAutomaton S ℕ} {C : ConfigSpace S CA}
    (P : InvariantMeasurePackage S CA C) where
  variationalPrincipleClosed : P.variationalPrinciple
  ergodicMeasuresNonempty : Nonempty P.ergodicMeasures

def InvariantMeasureClosed {S : Type} {CA : CellularAutomaton S ℕ} {C : ConfigSpace S CA}
    (P : InvariantMeasurePackage S CA C) : Prop :=
  P.variationalPrinciple ∧ Nonempty P.ergodicMeasures

theorem invariant_measure_closed_from_evidence {S : Type} {CA : CellularAutomaton S ℕ} {C : ConfigSpace S CA}
    (P : InvariantMeasurePackage S CA C) (E : InvariantMeasureEvidence P) :
    InvariantMeasureClosed P := by
  exact And.intro E.variationalPrincipleClosed E.ergodicMeasuresNonempty

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse