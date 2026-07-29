import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsCellularAutomataCanonicalLaneLean.CellularAutomatonSpace

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure TopologicalEntropyPackage {C : CellularAutomatonSpace} where
  separatedSetCardinality : ℕ → ℕ
  growthRate : ℝ
  entropyDefined : Prop
  variationalPrincipleHolds : Prop
  entropyDefinedTerm : entropyDefined
  variationalPrincipleTerm : variationalPrincipleHolds

structure TopologicalEntropyEvidence {C : CellularAutomatonSpace}
    (E : TopologicalEntropyPackage C) where
  entropyDefinedClosed : E.entropyDefined
  variationalPrincipleClosed : E.variationalPrincipleHolds

def TopologicalEntropyClosed {C : CellularAutomatonSpace} (E : TopologicalEntropyPackage C) : Prop :=
  E.entropyDefined ∧ E.variationalPrincipleHolds

theorem topological_entropy_closed_from_evidence {C : CellularAutomatonSpace}
    (E : TopologicalEntropyPackage C) (Ev : TopologicalEntropyEvidence E) :
    TopologicalEntropyClosed E := by
  exact And.intro Ev.entropyDefinedClosed Ev.variationalPrincipleClosed

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse