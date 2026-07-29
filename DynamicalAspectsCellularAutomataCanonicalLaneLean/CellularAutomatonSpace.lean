import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure CellularAutomatonSpace where
  cellSet : Type u
  stateSet : Type v
  neighborhoodFunc : cellSet → List cellSet
  localRule : (List stateSet) → stateSet
  topology : TopologicalSpace (cellSet → stateSet)
  shiftInvariant : Prop
  compactnessCondition : Prop
  shiftInvariantTerm : shiftInvariant
  compactnessConditionTerm : compactnessCondition

structure CellularAutomatonSpaceEvidence (C : CellularAutomatonSpace) where
  shiftInvariantClosed : C.shiftInvariant
  compactnessConditionClosed : C.compactnessCondition

def CellularAutomatonSpaceClosed (C : CellularAutomatonSpace) : Prop :=
  C.shiftInvariant ∧ C.compactnessCondition

theorem cellular_automaton_space_closed_from_evidence (C : CellularAutomatonSpace)
    (E : CellularAutomatonSpaceEvidence C) : CellularAutomatonSpaceClosed C := by
  exact And.intro E.shiftInvariantClosed E.compactnessConditionClosed

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse