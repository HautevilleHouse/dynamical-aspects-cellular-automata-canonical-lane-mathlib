import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure AttractorBasin (A : CellularAutomaton) where
  AttractorSet : Set (A.StateSpace)
  BasinOfAttraction : Set (A.StateSpace)
  AttractorClosedInvariant : Prop
  BasinOpenDense : Prop

structure AttractorBasinEvidence (A : CellularAutomaton) (B : AttractorBasin A) where
  attractorClosedInvariantClosed : B.AttractorClosedInvariant
  basinOpenDenseClosed : B.BasinOpenDense

def AttractorBasinClosed (A : CellularAutomaton) (B : AttractorBasin A) : Prop :=
  B.AttractorClosedInvariant ∧ B.BasinOpenDense

theorem attractor_basin_closed (A : CellularAutomaton) (B : AttractorBasin A) (E : AttractorBasinEvidence A B) :
    AttractorBasinClosed A B := by
  exact And.intro E.attractorClosedInvariantClosed E.basinOpenDenseClosed

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse