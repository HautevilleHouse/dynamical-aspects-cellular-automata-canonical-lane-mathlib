import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure ConfigSpace (S : Type) (CA : CellularAutomaton S ℕ) where
  space : Set (ℕ → S)
  metric : ℕ → S → S → Prop
  shiftAction : ℕ → (ℕ → S) → ℕ → S
  shiftContinuity : Prop
  shiftInvariantMeasure : Prop

structure ConfigDynamicsPackage (S : Type) (CA : CellularAutomaton S ℕ) (C : ConfigSpace S CA) where
  dynamics : (ℕ → S) → ℕ → ℕ → S
  shiftCommutation : Prop
  topologicalEntropy : Prop
  existenceOfErgodicMeasures : Prop

structure ConfigDynamicsEvidence {S : Type} {CA : CellularAutomaton S ℕ} {C : ConfigSpace S CA}
    (P : ConfigDynamicsPackage S CA C) where
  shiftCommutationClosed : P.shiftCommutation
  topologicalEntropyClosed : P.topologicalEntropy
  existenceOfErgodicMeasuresClosed : P.existenceOfErgodicMeasures

def ConfigDynamicsClosed {S : Type} {CA : CellularAutomaton S ℕ} {C : ConfigSpace S CA}
    (P : ConfigDynamicsPackage S CA C) : Prop :=
  P.shiftCommutation ∧ P.topologicalEntropy ∧ P.existenceOfErgodicMeasures

theorem config_dynamics_closed_from_evidence {S : Type} {CA : CellularAutomaton S ℕ} {C : ConfigSpace S CA}
    (P : ConfigDynamicsPackage S CA C) (E : ConfigDynamicsEvidence P) :
    ConfigDynamicsClosed P := by
  exact And.intro E.shiftCommutationClosed (And.intro E.topologicalEntropyClosed E.existenceOfErgodicMeasuresClosed)

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse