import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure CellularAutomaton where
  StateSpace : Type u
  Neighborhood : Type v
  LocalRule : (Neighborhood -> StateSpace) -> StateSpace
  Topology : TopologicalSpace StateSpace
  ShiftInvariant : Prop

structure CellularAutomatonEvidence (A : CellularAutomaton) where
  shiftInvariantClosed : A.ShiftInvariant

def CellularAutomatonClosed (A : CellularAutomaton) : Prop :=
  A.ShiftInvariant

theorem cellular_automaton_closed_from_evidence (A : CellularAutomaton) (E : CellularAutomatonEvidence A) :
    CellularAutomatonClosed A := by
  exact E.shiftInvariantClosed

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse