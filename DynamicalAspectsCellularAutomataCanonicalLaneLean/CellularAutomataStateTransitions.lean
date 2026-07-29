import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure CellularAutomaton (S : Type) (A : Type) where
  stateSet : Set S
  alphabet : Set A
  transitionFunction : A → S → S
  localConsistency : Prop

structure StateTransitionPackage (S : Type) (A : Type) (CA : CellularAutomaton S A) where
  globalTransitionFunction : S → S
  shiftInvariance : Prop
  continuity : Prop
  hasConsistentMapping : Prop

structure StateTransitionEvidence {S : Type} {A : Type} {CA : CellularAutomaton S A}
    (P : StateTransitionPackage S A CA) where
  globalTransitionFunctionClosed : P.globalTransitionFunction = CA.transitionFunction
  shiftInvarianceClosed : P.shiftInvariance
  continuityClosed : P.continuity
  hasConsistentMappingClosed : P.hasConsistentMapping

def StateTransitionClosed {S : Type} {A : Type} {CA : CellularAutomaton S A}
    (P : StateTransitionPackage S A CA) : Prop :=
  P.shiftInvariance ∧ P.continuity ∧ P.hasConsistentMapping

theorem state_transition_closed_from_evidence {S : Type} {A : Type} {CA : CellularAutomaton S A}
    (P : StateTransitionPackage S A CA) (E : StateTransitionEvidence P) :
    StateTransitionClosed P := by
  exact And.intro E.shiftInvarianceClosed (And.intro E.continuityClosed E.hasConsistentMappingClosed)

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse