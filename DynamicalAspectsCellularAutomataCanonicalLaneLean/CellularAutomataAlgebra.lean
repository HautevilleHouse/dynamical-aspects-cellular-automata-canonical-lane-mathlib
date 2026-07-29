import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure CellularAutomaton (S : Type) where
  states : S
  alphabet : Type
  localRule : alphabet ^ ℕ → alphabet
  configurationSpace : Type
  globalTransition : configurationSpace → configurationSpace

structure CellularAutomataAlgebra where
  automaton : CellularAutomaton (Fin 2)
  shiftInvariant : Prop
  additiveProperty : Prop
  algebraicClosure : Prop

structure CellularAutomataAlgebraEvidence (A : CellularAutomataAlgebra) where
  shiftInvariantClosed : A.shiftInvariant
  additivePropertyClosed : A.additiveProperty
  algebraicClosureClosed : A.algebraicClosure

def CellularAutomataAlgebraClosed (A : CellularAutomataAlgebra) : Prop :=
  A.shiftInvariant ∧ A.additiveProperty ∧ A.algebraicClosure

theorem cellular_automata_algebra_closed_from_evidence
    (A : CellularAutomataAlgebra) (E : CellularAutomataAlgebraEvidence A) :
    CellularAutomataAlgebraClosed A := by
  exact And.intro E.shiftInvariantClosed (And.intro E.additivePropertyClosed E.algebraicClosureClosed)

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse
