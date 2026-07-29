import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsCellularAutomataCanonicalLaneLean.CellularAutomatonSpace

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure InvariantMeasurePackage {C : CellularAutomatonSpace} where
  shiftInvariantMeasure : Type u
  ergodicMeasures : Set (shiftInvariantMeasure)
  measureEntropyRelation : Prop
  existenceOfInvariantMeasure : Prop
  ergodicDecomposition : Prop
  existenceTerm : existenceOfInvariantMeasure
  decompositionTerm : ergodicDecomposition

structure InvariantMeasureEvidence {C : CellularAutomatonSpace}
    (M : InvariantMeasurePackage C) where
  existenceClosed : M.existenceOfInvariantMeasure
  decompositionClosed : M.ergodicDecomposition

def InvariantMeasureClosed {C : CellularAutomatonSpace} (M : InvariantMeasurePackage C) : Prop :=
  M.existenceOfInvariantMeasure ∧ M.ergodicDecomposition

theorem invariant_measure_closed_from_evidence {C : CellularAutomatonSpace}
    (M : InvariantMeasurePackage C) (E : InvariantMeasureEvidence M) :
    InvariantMeasureClosed M := by
  exact And.intro E.existenceClosed E.decompositionClosed

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse